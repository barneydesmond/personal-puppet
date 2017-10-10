class systemd::base {
  anchor {
#    "systemd/presets-configured":    before  => Anchor["repos-configured"];


    "systemd/roots-created":         ;
    "systemd/dropin-dirs-created":   require => Anchor["systemd/roots-created"];
    "systemd/units-configured":      require => Anchor["systemd/dropin-dirs-created"];
    "systemd/daemon-reloaded":       require => Anchor["systemd/units-configured"];
    "systemd/units-actioned":        require => Anchor["systemd/daemon-reloaded"];

    "systemd/roots-created:*":       ;
    "systemd/dropin-dirs-created:*": require => Anchor["systemd/roots-created:*"];
    "systemd/units-configured:*":    require => Anchor["systemd/dropin-dirs-created:*"];
    "systemd/units-actioned:*":      require => Anchor["systemd/units-configured:*"];
  }

  exec { "systemd/daemon-reload":
    command     => shell_join([ "/bin/systemctl", "--system", "daemon-reload" ]),
    refreshonly => true,
    subscribe   => Anchor["systemd/units-configured"],
    notify      => Anchor["systemd/daemon-reloaded"];
  }
}
