class profile::ssh_server {
	package {'openssh-server':
		ensure => present,
	}
	service { 'sshd':
		ensure => 'running',
		enable => 'true',
	}
	ssh_authorized_key { 'root@master.puppet.vm':
		ensure => present,
		user   => 'root',
		type   => 'ssh-rsa',
		key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQChOGC8/2BxUbJuqW8PjG7vhb69kBvZsUBCwGZrbtbuntBKV1jw7+UxyDlW7E0W2K3s9qlXZGhtGrG4xFK2HbjfeC3LsOr4i3McpAcQpnMNVUnr3iuXSNts4B9a4UWN5SeL3j6vGy5pLgNu1UzddA3ciKvl8Bo62xhlo1LY8l2/NA9p+OOoZS76NukAWxD2OMSsbOIkGtHmR/4bjFvzmvHVWO4vayxU3odEgZzgbOdyHGUIkRl2UplCIWKbzXvMdPCN0rrq9vAEB/nuNTYfzUm4jMjHgFLpxa0J44ZxrM/BJzNQOh/g/BIMjmAiiPFaHEMs8k2Jyfc/x28csp8OUb0t',
	}  
}
