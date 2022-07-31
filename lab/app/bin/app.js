#!/usr/bin/env node
const cdk = require('aws-cdk-lib');
const { AppStack } = require('../lib/app-stack');

const app = new cdk.App();
new AppStack(app, 'AppStack');
