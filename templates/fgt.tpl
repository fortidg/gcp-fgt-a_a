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
     set mode static
     set ip ${port1-ip}/32
     set allowaccess https ssh
     set secondary-IP enable
     config secondaryip
       edit 0
         set ip ${elb_ip}/32
         set allowaccess probe-response
       next
  end   
  next
  edit port2
    set mode static
    set ip ${port2-ip}/32
    set allowaccess probe-response
    set secondary-IP enable
     config secondaryip
       edit 0
         set ip ${ilb_ip}/32
         set allowaccess probe-response
       next
  end
  next
end

config router static
  edit 0
    set device port1
    set gateway ${ext_gw}
  next
  edit 0
    set device port2
    set dst 35.191.0.0/16
    set gateway ${int_gw}
  next
  edit 0
    set device port2
    set dst 130.211.0.0/22
    set gateway ${int_gw}
  next
end

config system probe-response
    set mode http-probe
    set http-probe-value OK
    set port ${healthcheck_port}
end

config firewall policy
    edit 1
        set name "outbound"
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