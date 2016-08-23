# Push
A simple bash tool to push files to servers via SCP

### Installation

To install Push do the following:

```sh
$ wget https://raw.githubusercontent.com/Moudoux/Push/master/install.sh
$ sudo chmod +x install.sh
$ bash install.sh
```

### Setting it up

After you have installed push, you need to edit `~\bin\push.sh`

In the push.sh file there are the following variables:

```sh
# Push settings (Edit these to match your server)
PW='password'
PORT="22"
SERVER="127.0.0.1"
USERNAME="username"
```

Change the variables to match your server

### Usage

To use Push after installing and setting it up:

```sh
$ push <Source file> <Remote destination>
```
