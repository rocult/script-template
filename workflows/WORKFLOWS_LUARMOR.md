# Workflows - Luarmor

If you plan to release your script via Luarmor, this workflow automates that.
Please note that you must self host a GitHub runner and specify the `LUARMOR_API_KEY` secret.
Luarmor requires you to whitelist IPs, and you cannot whitelist all of the IPs GitHub uses.
Instead, self host your own GitHub runner and whitelist **both** your IPv4 and IPv6 addresses.
Furthermore, you need a [2captcha API key](https://2captcha.com/enterpage) since Luarmor now enforces a Cloudflare Turnstile CAPTCHA on the update script endpoint.
Set your 2captcha API key under the GitHub secret with the name of `TWOCAPTCHA_API_KEY`.
For the most part, **you need to figure this out by yourself**.
