# Workflows - Luarmor

If you plan to release your script via Luarmor, this workflow automates that.
Please note that you must self host a GitHub runner and specify the `LUARMOR_API_KEY` secret.
Luarmor requires you to whitelist IPs, and you cannot whitelist all of the IPs GitHub uses.
Instead, self host your own GitHub runner and whitelist **both** your IPv4 and IPv6 addresses.
For the most part, **you need to figure this out by yourself**.
