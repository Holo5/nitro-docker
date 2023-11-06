import fetch from 'node-fetch';
import csvParser from 'csv-parser';
import * as csvWriter from 'csv-writer';
import * as fs from "fs";
import {faker, fi} from '@faker-js/faker';

import puppeteer from 'puppeteer';

// Start /Applications/Microsoft\ Edge.app/Contents/MacOS/Microsoft\ Edge --remote-debugging-port=9222
//
const browser = await puppeteer.connect({
    browserURL: "http://127.0.0.1:9222/",
})


function startSession(username, password) {
    return new Promise(resolve => {
        fetch('http://localhost:8191/v1', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            // body: '{\n  "cmd": "request.get",\n  "url":"https://www.oldskoolhabbo.com/",\n  "userAgent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleW...",\n  "maxTimeout": 60000\n}',
            body: JSON.stringify({
                'cmd': 'sessions.create',
                'session': 'session1000',
                'url': 'https://www.oldskoolhabbo.com/',
                'userAgent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleW...',
                'maxTimeout': 60000,
                "cookies": [{"name": "voting_stamp", "value": "1699160400"}],
            })
        }).then(response => response.text()).then(res => {
            console.log('Response', res);

            resolve();
        })

    });
}

function destroySession(username, password) {
    return new Promise(resolve => {
        fetch('http://localhost:8191/v1', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            // body: '{\n  "cmd": "request.get",\n  "url":"https://www.oldskoolhabbo.com/",\n  "userAgent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleW...",\n  "maxTimeout": 60000\n}',
            body: JSON.stringify({
                'cmd': 'sessions.destroy',
                'session': 'session1000',
                'url': 'https://www.oldskoolhabbo.com',
                'userAgent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleW...',
                'maxTimeout': 60000,
                "cookies": [{"name": "voting_stamp", "value": "1699160400"}],
                'postData': `r_username=${username}&r_email=${username}%40gmail.com&r_password=${password}&r_password-confirmation=${password}&register=`
            })
        }).then(response => response.text()).then(res => {
            console.log("response", res);

            resolve()
        })

    });
}


async function openBot(sso) {
    // Launch the browser and open a new blank page
    const page = await browser.newPage();

    // Navigate the page to a URL
    await page.goto('http://127.0.0.1:1080/?sso=' + sso);

    // Set screen size
    await page.setViewport({width: 1376, height: 894});

    await page.waitForTimeout(4000);

    setTimeout(() => {
        page.close();
    }, 20000);
}

function login(username, password) {
    return new Promise(resolve => {
        fetch('http://localhost:8191/v1', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            // body: '{\n  "cmd": "request.get",\n  "url":"https://www.oldskoolhabbo.com/",\n  "userAgent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleW...",\n  "maxTimeout": 60000\n}',
            body: JSON.stringify({
                'cmd': 'request.post',
                'session': 'session1000',
                'url': 'https://www.oldskoolhabbo.com/authentication',
                'userAgent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleW...',
                'maxTimeout': 60000,
                "cookies": [{"name": "voting_stamp", "value": "1699160400"}],
                'postData': `username=${username}&password=${password}&login=`
            })
        }).then(response => response.text()).then(res => {
            resolve(res.slice(res.indexOf("sso=") + 4, res.indexOf("sso=") + 49).replaceAll("\\", "").replaceAll('"', ''))
        })
    });
}

function register(username, password) {
    return new Promise(resolve => {
        fetch('http://localhost:8191/v1', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            // body: '{\n  "cmd": "request.get",\n  "url":"https://www.oldskoolhabbo.com/",\n  "userAgent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleW...",\n  "maxTimeout": 60000\n}',
            body: JSON.stringify({
                'cmd': 'request.post',
                'session': 'session1000',
                'url': 'https://www.oldskoolhabbo.com/authentication',
                'userAgent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleW...',
                'maxTimeout': 60000,
                "cookies": [{"name": "voting_stamp", "value": "1699160400"}],
                'postData': `r_username=${username}&r_email=${username}%40gmail.com&r_password=${password}&r_password-confirmation=${password}&register=`
            })
        }).then(response => response.text()).then(res => {
            // console.log("response", res);
            resolve(res.slice(res.indexOf("sso=") + 4, res.indexOf("sso=") + 49).replaceAll("\\", "").replaceAll('"', ''))
        })

    });
}

async function readAllLogins() {
    let data = fs.readFileSync('logins.csv',
        { encoding: 'utf8', flag: 'r' });

    data = data.split('\n').map(d => d.split(',')[0].replaceAll("\\", "").replaceAll('"', ''));
    return data;
}

const file = fs.openSync('logins.csv', 'a');

async function registerAndConnect(name) {
    const ssoRegistered = await register(name, "qwerty");

    console.log('User registered', name, ssoRegistered);

    if(ssoRegistered.includes('Challenge')) {
        console.error("User failed !", name);
        return;
    }

    fs.writeSync(file, name + ',qwerty\n', null, 'utf8');

    console.log('Connecting...', name);
    await openBot(ssoRegistered);
    console.log("Ended", name);
}

async function loginAndConnect(name) {
    console.log("Login", name);
    const sso = await login(name, "qwerty");

    if(sso.includes('Challenge')) {
        console.error("User failed !", name);
        return;
    }

    console.log('User logged', name, sso);

    console.log('Connecting...', name);
    await openBot(sso);
    console.log("Ended", name);
}

async function delay(delay) {
    await new Promise(resolve => setTimeout(resolve, delay));
}


async function runRegistration() {
    const names = Array(15).fill(null).map(v => faker.person.lastName());

    for(let i = 0; i < names.length; i++) {
        await registerAndConnect(names[i]);
    }

    await browser.close();
}

async function runLogin() {
    console.log("Starting session :)");

    await startSession();

    console.log("Retrieving accounts");
    const names = await readAllLogins();

    console.log("Retrieved some accounts: ", names.length);
    for(let i = 0; i < names.length; i++) {
        console.log("Account", i + 1, "on", names.length + 1)
        await loginAndConnect(names[i]);
    }

    await delay(3000);
    await destroySession();

    // await browser.close();
}


runLogin();
