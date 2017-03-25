# e.g. testing/staging/production/trail/demo...
environment = "demo"

# aws region name
region = "us-west-2"

# How many spark works
workers_count = 10

# e.g. "ami-6xxxxxx"
# usually comes from your 'packer' baked image
instance_ami = ""

# your aws ssh key pair name
# please see: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#having-ec2-create-your-key-pair
instance_key_name = ""

# ec2 instance type
instance_type = "t2.micro"

# Who launched the cluster
owner = ""

# e.g. testing.dv.sv
dns_region_name = ""
