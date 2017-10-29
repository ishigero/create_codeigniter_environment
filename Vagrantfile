Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder "./", "/home/vagrant/work"
  config.ssh.forward_agent = true
  config.vm.provision  "file", source: "./configFiles/.htaccess", destination: ".htaccess"
  config.vm.provision  "file", source: "./configFiles/composer.json", destination: "composer.json"
  config.vm.provision  "file", source: "./configFiles/my.cnf", destination: "my.cnf"
  config.vm.provision  "file", source: "./configFiles/project.conf", destination: "project.conf"
  config.vm.provision  "file", source: "./configFiles/index.php", destination: "index.php"
  config.vm.provision  "file", source: "./configFiles/config.php", destination: "config.php"
  config.vm.provision  "file", source: "./configFiles/database.php", destination: "database.php"
  config.vm.provision  "file", source: "./configFiles/init.sql", destination: "init.sql"
  config.vm.provision :shell, :path => "./provision.sh", :privileged => false  
end