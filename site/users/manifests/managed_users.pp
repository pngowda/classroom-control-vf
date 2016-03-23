define users::managed_users{ 
  user { $title:
   ensure => present,
  }
  file { "/home/$tittle":
    ensure => directory,
    owner => $tittle,
    group => $group,
  }
}

