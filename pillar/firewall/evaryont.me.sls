firewalld:
  zones:
    public:
      services:
        - http
        - https
        - salt-master
