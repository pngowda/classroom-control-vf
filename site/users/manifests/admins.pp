class users::admins {
users::managed_users{"kelly":}
users::managed_users{"kriss":}
users::managed_users{"harry":
  group => admin,
}
}
