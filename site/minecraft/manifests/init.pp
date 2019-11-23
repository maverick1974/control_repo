class minecraft {
  $url = 'https://s3.amazonaws.com/Minecraft.Download/versions/1.12.2/minecraft_server.1.12.2.jar'
  $install_dir = '/opt/minecraft'
  $service_dir = '/etc/systemd/system/minecraft.service'
  file {$install_dir:
    ensure      => directory,
  }
  file {"${install_dir}/minecraft_server.jar":
    ensure      => file,
    source      => $url,
    before      =>  Service['minecraft',
  }
  package {'java':
    ensure      => present,
  }
  file {"${install_dir}/eula.txt":
    ensure      => file,
    content     => 'eula=true'
  }
  file {'$service_dir:
    ensure      => file,
    source      => 'puppet:///modules/minecraft/minecraft.service',
  }
  service { 'minecraft':
    ensure      => running,
    enable      => true,
    require     => [Package['Java'],File["${install_dir}/eula.txt"],File[{$service_dir}]],
  }
}
