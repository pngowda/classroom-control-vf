class users {
user{'prajwaln22':
 ensure => present,
 }
 include users::admins
}
