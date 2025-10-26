sudo apt remove --purge netdata -y

curl https://get.netdata.cloud/kickstart.sh > /tmp/netdata-kickstart.sh && sh /tmp/netdata-kickstart.sh --stable-channel --claim-token qHiCXePGVk9PyRPqZB8PlExmmP5gIXYKUXRRyUCwMd0sgwPHOP0YJ-HmFl-qEiEAfWM-lkZcwWWO6o99boODTLghMN7nqeczsszSoD310IodgDmgTIp7oYJe7hL0uPimn__omPk --claim-rooms 90522cdb-01a5-4ace-a9d8-3839ffc85fd8 --claim-url https://app.netdata.cloud

systemctl status netdata



