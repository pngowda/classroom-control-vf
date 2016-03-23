define users::managed_users { 
  user { $title:
   ensure => present,
  }
  file { "/home/$title":
    ensure => directory,
    owner => $tittle,
    group => $group,
  }
}

