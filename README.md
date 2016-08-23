# Push
Push is a simple bash tool to push files to servers via SCP. Insted of you having to type the `scp <Source> <Account>@<Host>:<Destination>` command each time you want to upload a file to your server, you can just type `push <Source> <Destination>`

### Installation

To install Push do the following:

```sh
$ wget https://raw.githubusercontent.com/Moudoux/Push/master/install.sh
$ sudo chmod +x install.sh
$ bash install.sh
```

### Setting it up

After you have installed push, you need to edit `~\bin\push.sh`

In the `push.sh` file there are the following variables:

```sh
PW='password'
PORT="22"
SERVER="127.0.0.1"
USERNAME="username"
```

Change the variables to match your server

You can also change `PWPROMPT="false"` to `PWPROMPT="true"` and set `PW='password'` to `PW=''` if you don't want it to automatically authenticate you.

### Usage

To use Push after installing and setting it up:

```sh
$ push <Source file> <Remote destination>
```
