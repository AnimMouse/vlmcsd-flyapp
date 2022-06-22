# vlmcsd on fly.io
[vlmcsd KMS Emulator](https://github.com/kkkgo/vlmcsd) on [fly.io](https://fly.io)

Run your own KMS Emulator server for free (within free tier) on fly.io

Activate your Windows and Microsoft Office via KMS without leaving traces of activator in your PC.

## fly.io Deployment
You need [flyctl](https://github.com/superfly/flyctl)

1. Clone this repository.
2. Check if vlmcsd version in Dockerfile is latest, if not, change to the latest version.
3. Create an app on fly.io `fly launch --copy-config --name app-name --no-deploy`.
4. Select the region closest to you.
5. Deploy to fly.io `fly deploy -a app-name --remote-only`.
6. Test vlmcsd using vlmcs. `vlmcs -v app-name.fly.dev`

It is recommended to have a custom domain name.

### fly.io free tier
fly.io requires a credit card in order to work, if you don't have a credit card or if you are afraid that fly.io will charge you so much, it is recommend to buy prepaid credits that can be used with virtual credit cards.

## Activation
### Windows
1. `slmgr /skms app-name.fly.dev`
2. `slmgr /ato`

### Microsoft Office
1. `cscript "C:\Program Files\Microsoft Office\Office16\ospp.vbs" /sethst:app-name.fly.dev`
2. `cscript "C:\Program Files\Microsoft Office\Office16\ospp.vbs" /act`

## Command line explanations
1. `-T0` Disable the inclusion of date and time in each line of the log.
2. `-D` Do not daemonize and run in foreground.
3. `-e` Write all logging output to stdout so that you can see the log in fly.io.
4. `-c1` Check if the client time differs no more than four hours from the system time.