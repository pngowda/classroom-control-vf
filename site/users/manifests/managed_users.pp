define users::managed_users(
  $group=$tittle,
 )
{ user { $title:
   ensure => present,
  }
  file { "/home/$tittle":
    ensure => directory,
    owner => $tittle,
    group => $group
  }
}

