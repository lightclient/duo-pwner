# Duo Pwner

## How to Defeat Duo

1. Goto https://accounts.iam.ucla.edu/mfa and link a new smartphone.
![](/images/link-new-device.png)

2. Don't worry about downloading Duo. You don't need it anymore!
![](/images/duo-download.png)

3. Give your Duo Pwner a name. Add a different phone number than the one is linked on your account. It shouldn't matter what you type in here.
![](/images/name-the-device.png)

4. Instead of using the QR code, click the link have an activation link emailed to you.
![](/images/email-activation-link.png)

5. Get the link from your email.
![](/images/get-activation-link.png)

6. Run the following command in your terminal.

```
curl https://raw.githubusercontent.com/c-o-l-o-r/duo-pwner/master/pwn.sh | bash -s YOUR_ACTIVATION_LINK
```
![](/images/command-line.png)

7. Point your browser of choice to http://0.0.0.0:6080 to watch the magic!
