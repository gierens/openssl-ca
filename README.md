# openssl-ca
Scripts, config file examples and Makefile to create an OpenSSL certificate
authority and issue server certificates with it.

Based on: https://stackoverflow.com/questions/21297139/how-do-you-sign-a-certificate-signing-request-with-your-certification-authority/21340898#21340898

# How to use it
If you already created the CA and just added new server configs, you can
directly proceed to step 3.

0. Create `~/.rnd` if you don't already have it. You may use `touch ~/.rnd`.
1. Alter the `ca.cnf` to your liking. You might also want to update the `-days`
   argument in the `create_ca.sh` otherwise it defaults to 30 days only. (I
   haven't yet found a way to set this in the config file. In case you do
   please let me know!)
2. (Optional) Execute `make ca` to create the CA already.
3. Create server configurations based on `server.example.com.cnf`. Use the
   FQDN as base name and make sure to replace all occasions of
   `server.example.com` by your machine's hostname.
4. Execute `make` and that's it.

Note: like the server configuration the keys and certificates will also have
the FQDN as base name. To view certificates you can use something like:
`openssl x509 -in server.example.com.crt -text`

## Clean up
Use `make clean` to remove all server keys and certificates, not this is not
the same as properly revoking them. To remove the the CA use `make clean-ca`.
