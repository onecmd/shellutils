# shellutils
Shell utils library, include:
- Pretty logs
  - Print time
  - Print script name
  - Print log level
  - Print file
- Load file variables to env variables
  - Load properties variables to env
  - Load json variables to env
- Set|Unset proxies for
  - System
  - ENV
  - YUM
  - Docker
  - NPM
- Install|Uninstall software by one command, resolve proxies and dependencies issue automatically, select fast mirrors automatically
  - jq
  - Docker
  - Java
  - Golang
  - Nginx
  - Apache
  - Tomcat
  - Kubernetes
  - Microk8s
  - Ansible
  - Terraform
  - node_exporter

## Usage example
Download or unzip the library to /opt, eg. /opt/shellutils, then run the command.

### Pretty logs
Log logs to file: /var/log/shellutils.log

#### Usage
- Import pretty logs library in script:
```
. /opt/shellutils/logs/pretty_logs.sh
```
- Print logs:
```
info "Start to create configuration..."
info "check_env_parameters..."
warn "LAB_ID not set, use default."
error "Not found Openstack lab vars file: /opt/oneshell/runtime/lab_vars.sh!"
log_file /tmp/example.properties
```
- Logs output example:
```
2020-08-24 03:17:06 | /opt/oneshell/main.sh | INFO | Start to create configuration...
2020-08-24 03:17:07 | /opt/oneshell/main.sh | INFO | check_env_parameters...
2020-08-24 03:17:07 | /opt/oneshell/main.sh | WARN | LAB_ID not set, use default.
2020-08-24 03:17:07 | /opt/oneshell/main.sh | ERROR | Not found Openstack lab vars file: /opt/oneshell/runtime/lab_vars.sh!
2020-08-24 03:17:07 | /opt/oneshell/main.sh | INFO | cat /tmp/example.properties
var_a=a
var_b=b
var_c=c
```

### Load file variables to env variables
#### Load properties variables to env
- Use command:
```
. /opt/shellutils/env/load_properties_to_env.sh {properties file path}
```
Then can use the env variables which defined in properties file.

#### Load json variables to env
Precondition: install jq: https://stedolan.github.io/jq/ .
- Json file format like:
```
{
    "parameter_1":"value_1",
    "parameter_2":"value_2"
}
```
- Load json variables to env:
```
sh /opt/shellutils/env/load_json_to_env.sh {json file path}
```
Then can use the env variables which defined in json file.

### Set|Unset proxies
Set proxy in file: /opt/shellutils/proxies/config/proxies_config.properties

#### Set|unset proxy for system
```
sh /opt/shellutils/proxies/system.sh set|unset [proxy]
```

#### Set|unset proxy for env
```
sh /opt/shellutils/proxies/env.sh set|unset [proxy]
```

#### Set|unset proxy for yum
```
sh /opt/shellutils/proxies/yum.sh set|unset [proxy]
```

#### Set|unset proxy for docker
Precondition: docker installed
```
sh /opt/shellutils/proxies/docker.sh set|unset [proxy]
```

#### Set|unset proxy for npm
Precondition: npm installed
```
sh /opt/shellutils/proxies/npm.sh set|unset [proxy]
```

#### Set|unset proxy for git
Precondition: git installed
```
sh /opt/shellutils/proxies/git.sh set|unset [proxy]
```

### Install services
Install|Uninstall software by one command, resolve proxies and dependencies issue automatically, select fast mirrors automatically. Supported CentOS, Ubuntu, Debian linux releases.

#### Install jq
jq used for json parse in shell.
- Run command to install jq:
```
sh /opt/shellutils/install/jq.sh install
```
- Run command to uninstall jq:
```
sh /opt/shellutils/install/jq.sh uninstall
```

#### Install docker
- Run command to install docker:
```
sh /opt/shellutils/install/docker.sh install
```
- Run command to uninstall docker:
```
sh /opt/shellutils/install/docker.sh uninstall
```
