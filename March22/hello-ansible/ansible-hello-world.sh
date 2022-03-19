ansible --inventory ./inventory --ask-pass --module-name ping all

ansible -i ./inventory -m ping -k all