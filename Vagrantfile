# Lazy list of boxes that exist
@boxes = [
  ['master', 'arch'],
  ['owncloud', 'arch'],
  ['ipa', 'centos'],
]

@box_settings = {
  'arch' => {
    'box' => 'ogarcia/archlinux-x64', 
    'cache' => :pacman
  },
  'centos' => {
    'box' => 'bento/centos-7.1', 
    'cache' => :yum
  }
}

Vagrant.configure(2) do |config|
  config.vm.box = 'ogarcia/archlinux-x64'

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Every box will be updated & have salt installed
  config.vm.provision :shell, path: 'base_install.sh', privileged: true

  # Speed up some of the package downloads
  if Vagrant.has_plugin?('vagrant-cachier')
    config.cache.scope = :box
    config.cache.enable :pacman
    config.cache.enable :yum
  end

  @boxes.each_with_index do |box, box_number|
    last_ip = 11+box_number
    box_name = box[0]
    box_type = box[1]

    config.vm.define box_name do |box|
      box.vm.box = @box_settings[box_type]['box']
      box.vm.hostname = "#{box_name}.dev.aether.nu"
      box.vm.network :private_network, ip: "10.20.30.#{last_ip}"
      box.vm.provider :virtualbox do |vb|
        vb.name = "#{box_name}.dev.aether.nu"
      end

      box.vm.synced_folder '.', '/vagrant', disabled: true

      if box_name == 'master'
        box.vm.synced_folder '.', '/srv'
      end
    end
  end
end
