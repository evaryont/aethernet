# Lazy list of boxes that exist
@boxes = [
  "master",
  "owncloud",
]

Vagrant.configure(2) do |config|
  config.vm.box = "ogarcia/archlinux-x64"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Every box will be updated & have salt installed
  config.vm.provision :shell, path: "base_install.sh", privileged: true

  @boxes.each do |box_name|
    last_ip = 11+@boxes.index(box_name)
    config.vm.define box_name do |box|
      box.vm.hostname = "#{box_name}.dev.aether.nu"
      box.vm.network :private_network, ip: "10.20.30.#{last_ip}"
      box.vm.provider :virtualbox do |vb|
        vb.name = "#{box_name}.dev.aether.nu"
      end

      box.vm.synced_folder ".", "/vagrant", disabled: true

      if box_name == "master"
        box.vm.synced_folder ".", "/srv"
      end
    end
  end
end
