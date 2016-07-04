gitlab_gitlab-ce:
  pkgrepo.managed:
    - humanname: Gitlab CE
    - baseurl: https://packages.gitlab.com/gitlab/gitlab-ce/el/7/$basearch
    - repo_gpgcheck: 1
    - gpgcheck: 0
    - enabled: 1
    - gpgkey: https://packages.gitlab.com/gitlab/gitlab-ce/gpgkey
    - sslverify: 1
    - sslcacert: /etc/pki/tls/certs/ca-bundle.crt

gitlab_gitlab-ce_source:
  pkgrepo.managed:
    - humanname: Gitlab CE - Source
    - baseurl: https://packages.gitlab.com/gitlab/gitlab-ce/el/7/SRPMS
    - repo_gpgcheck: 1
    - gpgcheck: 0
    - enabled: 1
    - gpgkey: https://packages.gitlab.com/gitlab/gitlab-ce/gpgkey
    - sslverify: 1
    - sslcacert: /etc/pki/tls/certs/ca-bundle.crt

gitlab-ce:
  pkg.installed
