resource "google_backup_dr_restore_workload" "backup_dr_restore_workloads" {
  for_each = var.backup_dr_restore_workloads

  backup_id                  = each.value.backup_id
  backup_vault_id            = each.value.backup_vault_id
  data_source_id             = each.value.data_source_id
  location                   = each.value.location
  clear_overrides_field_mask = each.value.clear_overrides_field_mask
  delete_restored_instance   = each.value.delete_restored_instance
  deletion_policy            = each.value.deletion_policy
  name                       = each.value.name
  request_id                 = each.value.request_id

  dynamic "compute_instance_restore_properties" {
    for_each = each.value.compute_instance_restore_properties != null ? [each.value.compute_instance_restore_properties] : []
    content {
      dynamic "advanced_machine_features" {
        for_each = compute_instance_restore_properties.value.advanced_machine_features != null ? [compute_instance_restore_properties.value.advanced_machine_features] : []
        content {
          enable_nested_virtualization = advanced_machine_features.value.enable_nested_virtualization
          enable_uefi_networking       = advanced_machine_features.value.enable_uefi_networking
          threads_per_core             = advanced_machine_features.value.threads_per_core
          visible_core_count           = advanced_machine_features.value.visible_core_count
        }
      }
      dynamic "allocation_affinity" {
        for_each = compute_instance_restore_properties.value.allocation_affinity != null ? [compute_instance_restore_properties.value.allocation_affinity] : []
        content {
          consume_allocation_type = allocation_affinity.value.consume_allocation_type
          key                     = allocation_affinity.value.key
          values                  = allocation_affinity.value.values
        }
      }
      can_ip_forward = compute_instance_restore_properties.value.can_ip_forward
      dynamic "confidential_instance_config" {
        for_each = compute_instance_restore_properties.value.confidential_instance_config != null ? [compute_instance_restore_properties.value.confidential_instance_config] : []
        content {
          enable_confidential_compute = confidential_instance_config.value.enable_confidential_compute
        }
      }
      deletion_protection = compute_instance_restore_properties.value.deletion_protection
      description         = compute_instance_restore_properties.value.description
      dynamic "disks" {
        for_each = compute_instance_restore_properties.value.disks != null ? compute_instance_restore_properties.value.disks : []
        content {
          auto_delete = disks.value.auto_delete
          boot        = disks.value.boot
          device_name = disks.value.device_name
          dynamic "disk_encryption_key" {
            for_each = disks.value.disk_encryption_key != null ? [disks.value.disk_encryption_key] : []
            content {
              kms_key_name            = disk_encryption_key.value.kms_key_name
              kms_key_service_account = disk_encryption_key.value.kms_key_service_account
              raw_key                 = disk_encryption_key.value.raw_key
              rsa_encrypted_key       = disk_encryption_key.value.rsa_encrypted_key
            }
          }
          disk_interface = disks.value.disk_interface
          disk_size_gb   = disks.value.disk_size_gb
          disk_type      = disks.value.disk_type
          dynamic "guest_os_feature" {
            for_each = disks.value.guest_os_feature != null ? disks.value.guest_os_feature : []
            content {
              type = guest_os_feature.value.type
            }
          }
          index = disks.value.index
          dynamic "initialize_params" {
            for_each = disks.value.initialize_params != null ? [disks.value.initialize_params] : []
            content {
              disk_name     = initialize_params.value.disk_name
              replica_zones = initialize_params.value.replica_zones
            }
          }
          kind        = disks.value.kind
          license     = disks.value.license
          mode        = disks.value.mode
          saved_state = disks.value.saved_state
          source      = disks.value.source
          type        = disks.value.type
        }
      }
      dynamic "display_device" {
        for_each = compute_instance_restore_properties.value.display_device != null ? [compute_instance_restore_properties.value.display_device] : []
        content {
          enable_display = display_device.value.enable_display
        }
      }
      dynamic "guest_accelerators" {
        for_each = compute_instance_restore_properties.value.guest_accelerators != null ? compute_instance_restore_properties.value.guest_accelerators : []
        content {
          accelerator_count = guest_accelerators.value.accelerator_count
          accelerator_type  = guest_accelerators.value.accelerator_type
        }
      }
      hostname = compute_instance_restore_properties.value.hostname
      dynamic "instance_encryption_key" {
        for_each = compute_instance_restore_properties.value.instance_encryption_key != null ? [compute_instance_restore_properties.value.instance_encryption_key] : []
        content {
          kms_key_name            = instance_encryption_key.value.kms_key_name
          kms_key_service_account = instance_encryption_key.value.kms_key_service_account
          raw_key                 = instance_encryption_key.value.raw_key
          rsa_encrypted_key       = instance_encryption_key.value.rsa_encrypted_key
        }
      }
      key_revocation_action_type = compute_instance_restore_properties.value.key_revocation_action_type
      dynamic "labels" {
        for_each = compute_instance_restore_properties.value.labels != null ? compute_instance_restore_properties.value.labels : []
        content {
          key   = labels.value.key
          value = labels.value.value
        }
      }
      machine_type = compute_instance_restore_properties.value.machine_type
      dynamic "metadata" {
        for_each = compute_instance_restore_properties.value.metadata != null ? [compute_instance_restore_properties.value.metadata] : []
        content {
          dynamic "items" {
            for_each = metadata.value.items != null ? metadata.value.items : []
            content {
              key   = items.value.key
              value = items.value.value
            }
          }
        }
      }
      min_cpu_platform = compute_instance_restore_properties.value.min_cpu_platform
      name             = compute_instance_restore_properties.value.name
      dynamic "network_interfaces" {
        for_each = compute_instance_restore_properties.value.network_interfaces != null ? compute_instance_restore_properties.value.network_interfaces : []
        content {
          dynamic "access_configs" {
            for_each = network_interfaces.value.access_configs != null ? network_interfaces.value.access_configs : []
            content {
              external_ip                 = access_configs.value.external_ip
              external_ipv6               = access_configs.value.external_ipv6
              external_ipv6_prefix_length = access_configs.value.external_ipv6_prefix_length
              name                        = access_configs.value.name
              network_tier                = access_configs.value.network_tier
              public_ptr_domain_name      = access_configs.value.public_ptr_domain_name
              set_public_ptr              = access_configs.value.set_public_ptr
              type                        = access_configs.value.type
            }
          }
          dynamic "alias_ip_ranges" {
            for_each = network_interfaces.value.alias_ip_ranges != null ? network_interfaces.value.alias_ip_ranges : []
            content {
              ip_cidr_range         = alias_ip_ranges.value.ip_cidr_range
              subnetwork_range_name = alias_ip_ranges.value.subnetwork_range_name
            }
          }
          internal_ipv6_prefix_length = network_interfaces.value.internal_ipv6_prefix_length
          ip_address                  = network_interfaces.value.ip_address
          dynamic "ipv6_access_configs" {
            for_each = network_interfaces.value.ipv6_access_configs != null ? network_interfaces.value.ipv6_access_configs : []
            content {
              external_ip                 = ipv6_access_configs.value.external_ip
              external_ipv6               = ipv6_access_configs.value.external_ipv6
              external_ipv6_prefix_length = ipv6_access_configs.value.external_ipv6_prefix_length
              name                        = ipv6_access_configs.value.name
              network_tier                = ipv6_access_configs.value.network_tier
              public_ptr_domain_name      = ipv6_access_configs.value.public_ptr_domain_name
              set_public_ptr              = ipv6_access_configs.value.set_public_ptr
              type                        = ipv6_access_configs.value.type
            }
          }
          ipv6_access_type   = network_interfaces.value.ipv6_access_type
          ipv6_address       = network_interfaces.value.ipv6_address
          network            = network_interfaces.value.network
          network_attachment = network_interfaces.value.network_attachment
          nic_type           = network_interfaces.value.nic_type
          queue_count        = network_interfaces.value.queue_count
          stack_type         = network_interfaces.value.stack_type
          subnetwork         = network_interfaces.value.subnetwork
        }
      }
      dynamic "network_performance_config" {
        for_each = compute_instance_restore_properties.value.network_performance_config != null ? [compute_instance_restore_properties.value.network_performance_config] : []
        content {
          total_egress_bandwidth_tier = network_performance_config.value.total_egress_bandwidth_tier
        }
      }
      dynamic "params" {
        for_each = compute_instance_restore_properties.value.params != null ? [compute_instance_restore_properties.value.params] : []
        content {
          dynamic "resource_manager_tags" {
            for_each = params.value.resource_manager_tags != null ? params.value.resource_manager_tags : []
            content {
              key   = resource_manager_tags.value.key
              value = resource_manager_tags.value.value
            }
          }
        }
      }
      private_ipv6_google_access = compute_instance_restore_properties.value.private_ipv6_google_access
      resource_policies          = compute_instance_restore_properties.value.resource_policies
      dynamic "scheduling" {
        for_each = compute_instance_restore_properties.value.scheduling != null ? [compute_instance_restore_properties.value.scheduling] : []
        content {
          automatic_restart           = scheduling.value.automatic_restart
          instance_termination_action = scheduling.value.instance_termination_action
          dynamic "local_ssd_recovery_timeout" {
            for_each = scheduling.value.local_ssd_recovery_timeout != null ? [scheduling.value.local_ssd_recovery_timeout] : []
            content {
              nanos   = local_ssd_recovery_timeout.value.nanos
              seconds = local_ssd_recovery_timeout.value.seconds
            }
          }
          dynamic "max_run_duration" {
            for_each = scheduling.value.max_run_duration != null ? [scheduling.value.max_run_duration] : []
            content {
              nanos   = max_run_duration.value.nanos
              seconds = max_run_duration.value.seconds
            }
          }
          min_node_cpus = scheduling.value.min_node_cpus
          dynamic "node_affinities" {
            for_each = scheduling.value.node_affinities != null ? scheduling.value.node_affinities : []
            content {
              key      = node_affinities.value.key
              operator = node_affinities.value.operator
              values   = node_affinities.value.values
            }
          }
          on_host_maintenance = scheduling.value.on_host_maintenance
          preemptible         = scheduling.value.preemptible
          provisioning_model  = scheduling.value.provisioning_model
          termination_time    = scheduling.value.termination_time
        }
      }
      dynamic "service_accounts" {
        for_each = compute_instance_restore_properties.value.service_accounts != null ? compute_instance_restore_properties.value.service_accounts : []
        content {
          email  = service_accounts.value.email
          scopes = service_accounts.value.scopes
        }
      }
      dynamic "shielded_instance_config" {
        for_each = compute_instance_restore_properties.value.shielded_instance_config != null ? [compute_instance_restore_properties.value.shielded_instance_config] : []
        content {
          enable_integrity_monitoring = shielded_instance_config.value.enable_integrity_monitoring
          enable_secure_boot          = shielded_instance_config.value.enable_secure_boot
          enable_vtpm                 = shielded_instance_config.value.enable_vtpm
        }
      }
      dynamic "tags" {
        for_each = compute_instance_restore_properties.value.tags != null ? [compute_instance_restore_properties.value.tags] : []
        content {
          items = tags.value.items
        }
      }
    }
  }

  dynamic "compute_instance_target_environment" {
    for_each = each.value.compute_instance_target_environment != null ? [each.value.compute_instance_target_environment] : []
    content {
      project                     = compute_instance_target_environment.value.project
      use_project_service_account = compute_instance_target_environment.value.use_project_service_account
      zone                        = compute_instance_target_environment.value.zone
    }
  }

  dynamic "disk_restore_properties" {
    for_each = each.value.disk_restore_properties != null ? [each.value.disk_restore_properties] : []
    content {
      access_mode  = disk_restore_properties.value.access_mode
      architecture = disk_restore_properties.value.architecture
      description  = disk_restore_properties.value.description
      dynamic "disk_encryption_key" {
        for_each = disk_restore_properties.value.disk_encryption_key != null ? [disk_restore_properties.value.disk_encryption_key] : []
        content {
          kms_key_name            = disk_encryption_key.value.kms_key_name
          kms_key_service_account = disk_encryption_key.value.kms_key_service_account
          raw_key                 = disk_encryption_key.value.raw_key
          rsa_encrypted_key       = disk_encryption_key.value.rsa_encrypted_key
        }
      }
      enable_confidential_compute = disk_restore_properties.value.enable_confidential_compute
      dynamic "guest_os_feature" {
        for_each = disk_restore_properties.value.guest_os_feature != null ? disk_restore_properties.value.guest_os_feature : []
        content {
          type = guest_os_feature.value.type
        }
      }
      dynamic "labels" {
        for_each = disk_restore_properties.value.labels != null ? disk_restore_properties.value.labels : []
        content {
          key   = labels.value.key
          value = labels.value.value
        }
      }
      licenses                  = disk_restore_properties.value.licenses
      name                      = disk_restore_properties.value.name
      physical_block_size_bytes = disk_restore_properties.value.physical_block_size_bytes
      provisioned_iops          = disk_restore_properties.value.provisioned_iops
      provisioned_throughput    = disk_restore_properties.value.provisioned_throughput
      dynamic "resource_manager_tags" {
        for_each = disk_restore_properties.value.resource_manager_tags != null ? disk_restore_properties.value.resource_manager_tags : []
        content {
          key   = resource_manager_tags.value.key
          value = resource_manager_tags.value.value
        }
      }
      resource_policy = disk_restore_properties.value.resource_policy
      size_gb         = disk_restore_properties.value.size_gb
      storage_pool    = disk_restore_properties.value.storage_pool
      type            = disk_restore_properties.value.type
    }
  }

  dynamic "disk_target_environment" {
    for_each = each.value.disk_target_environment != null ? [each.value.disk_target_environment] : []
    content {
      project                     = disk_target_environment.value.project
      use_project_service_account = disk_target_environment.value.use_project_service_account
      zone                        = disk_target_environment.value.zone
    }
  }

  dynamic "region_disk_target_environment" {
    for_each = each.value.region_disk_target_environment != null ? [each.value.region_disk_target_environment] : []
    content {
      project                     = region_disk_target_environment.value.project
      region                      = region_disk_target_environment.value.region
      replica_zones               = region_disk_target_environment.value.replica_zones
      use_project_service_account = region_disk_target_environment.value.use_project_service_account
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
    }
  }
}

