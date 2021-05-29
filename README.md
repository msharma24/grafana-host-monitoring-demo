# 	Host Monitoring with Grafana Web 



### Introduction
**This project configures a Ubuntu 1804 Bionic VM with CollectD , InfluxDB and Grafana Web UI Dashboard to display the host metrics.**

* [CollectD](https://collectd.org/) - CollectD is a daemon which collects system and application performance metrics periodically and provides mechanisms to store the values in a variety of ways.
* [InfluxDB](https://www.influxdata.com/) - InfluxDB is a Time Series database and in this project CollectD writes metrics into the InfluxDB Database.
* [Grafana](https://grafana.com/) - Grafana Web Server is used to visualise the metrics -In this project Grafana uses InfluxDB as a DataSource to Visualize the Host Metrics

### Tools
**The project uses the following tools:**

1. [Vagrant](https://www.vagrantup.com/) - For VM Management.
2. [Oracle Virtualbox](https://www.virtualbox.org/) - For hosting the VM
3. [Ansible](https://www.ansible.com/) - For the VM Configuration Management
4. [Terraform](https://www.terraform.io/)- For Managing the Grafana Dashboards and  GrafanaData Sources
5. [ServerSpec](https://serverspec.org/) - For Integration Testing
6. [Molecule](https://molecule.readthedocs.io/en/latest/) - For Ansible unit testing

### Project Directory Structure
```.
├── Vagrantfile ==>  Vagrantfile for the vagrant VM Config
├── roles
│   └── ansible-role-configure-grafana-influxdb-collectd ==> Ansible Role
│       ├── defaults
│       ├── files
│       ├── handlers
│       ├── meta
│       ├── molecule ==> Molecule Configuration for Ansible Role Testing
│       │   └── default
│       ├── tasks
│       ├── templates
│       ├── tests
│       └── vars
├── screenshots
├── spec ==> Acceptance Tests
│   └── default
└── terraform ==> Terraform Configuration files for Grafana Dashboard
```

## Development
**Pre-requisites to setup the development enviroment**


1. Python 3.8.x
2. ruby 2.6.x
3. Terraform 13.x
4. Hashicorp Vagrant 2.2.x
5. Oracle VirtualBox 6.1.x


### Setup Instructions

1. Create a Python3 virtualenv `python3 -m venv .venv && source .ven/bin/activate`
2. Go to the `.venv` virtualenv dir and git clone this project `git clone URL`
3. Install python dependencies `pip install -r requirementx.txt`
4. Install ruby gems 

``` gem install serverspec ```


### Build VM
1. Trigger the VM Provisioning with Vagrant

 ```vagrant up --provision```

The VM will provisioned using the ansible role .

The VM will forward the Grafana Port `3000` from the VM to the Host Machine on the port `8080` and the user can access the Grafana Web UI by acessing `http://localhost:3000/login`

### Build Grafana Dashboard

2. Create Grafana Dashboard using Terraform - In order to create the Grafana Dashboard we will besing Terraform . Execute the follwing command to build the Grafana Dashboard.

```
	cd terraform && ./run_terraform.sh
```

> **WARNING** - Terraform Configuration uses the default Graana Username: admin & Password: admin for local development and demo of this project

2. Once the Terraform completes provisioning - Browse `http://localhost:3000/login` and login with default usernae and password


```
	username:  admin 
	password:  admin
```

### Testing

### Acceptance Tests
1.  Acceptance Testing Post VM Provision is done using ServerSpec Tests - Which validates the coniguration state of the machine.

Run the following command to run the serverspec tests

```rake spec```

### Unit Tests
2. Ansible Role Unit Testing with Molecule

Ansible role can be unit tested though out the development with Molecule - which uses an Ubuntu 1804 Docker image to provision the role . This project is using ansible as a verifier for the tests but molecule testing can be extended with `testinfra`

To Run the molecule tests -

```cd roles/ansible-role-configure-grafana-influxdb-collectd && molecule test```

## Demo Execution
Install [asciinema](https://asciinema.org/docs/installation) to watch a demo exeuction of this project.
Once your have installed the asciinema, Run the following command in the root of the project.

```asciinema play demo/project-execution-demo
```

### Screenshot
Demo Grafana Dashboard Screenshots can be found in the `screenshots` directory



