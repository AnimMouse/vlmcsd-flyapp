# vlmcsd on fly.io
[vlmcsd KMS Emulator](https://github.com/kkkgo/vlmcsd) on [fly.io](https://fly.io)

Run your own KMS Emulator server for free (within free tier) on fly.io

> [!NOTE]
> On 2024, fly.io will now charge $2/mo for a dedicated IPv4 address, but everything under $5 bill monthly is waved, so if you have 2 or fewer dedicated IPv4, it is still free.

Activate your Windows and Microsoft Office via KMS without leaving traces of activator in your PC.

> [!TIP]
> With the introduction of Ohook activation method on Microsoft Office, hosting your own KMS Emulator is not needed anymore.

## fly.io Deployment
You need [flyctl](https://github.com/superfly/flyctl) installed.

1. Clone this repository.
2. Check if vlmcsd version in `Dockerfile` is latest, if not, change to the latest version.
3. Login to flyctl by using `fly auth login`.
4. Create an app on fly.io `fly launch --copy-config --name app-name --no-deploy --vm-memory 256`.
5. When asked to tweak these settings before proceeding, enter yes if you want to tweak settings like selecting the region closest to you, otherwise, enter no.
6. Deploy to fly.io `fly deploy -a app-name --ha=false`.
7. When asked to allocate a dedicated IPv4 address, enter yes.
8. Test vlmcsd using vlmcs. `vlmcs -v app-name.fly.dev`

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