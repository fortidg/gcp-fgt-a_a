config system global
    set admin-sport ${admin_port}
    set hostname ${fgt_name}
    set admintimeout 60
end
config system admin
    edit "admin"
        set password ${fgt_password}
    next
end
config system sdn-connector
    edit "gcp"
        set type gcp
    next
end

config system interface
  edit port1
     set allowaccess probe-response https ssh
  next
  edit port2
  set allowaccess probe-response
  next
end

config system probe-response
    set mode http-probe
    set http-probe-value OK
    set port ${healthcheck_port}
end

config firewall policy
    edit 1
        set name "$outbound"
        set srcintf "port2"
        set dstintf "port1"
        set action accept
        set srcaddr "all"
        set dstaddr "all"
        set schedule "always"
        set service "ALL"
        set comments "out to internet"
    next
end