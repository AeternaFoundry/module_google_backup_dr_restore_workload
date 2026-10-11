variable "backup_dr_restore_workloads" {
  description = <<EOT
Map of backup_dr_restore_workloads, attributes below
Required:
    - backup_id
    - backup_vault_id
    - data_source_id
    - location
Optional:
    - clear_overrides_field_mask
    - delete_restored_instance
    - deletion_policy
    - name
    - request_id
    - compute_instance_restore_properties (block):
        - advanced_machine_features (optional, block):
            - enable_nested_virtualization (optional)
            - enable_uefi_networking (optional)
            - threads_per_core (optional)
            - visible_core_count (optional)
        - allocation_affinity (optional, block):
            - consume_allocation_type (optional)
            - key (optional)
            - values (optional)
        - can_ip_forward (optional)
        - confidential_instance_config (optional, block):
            - enable_confidential_compute (optional)
        - deletion_protection (optional)
        - description (optional)
        - disks (optional, block):
            - auto_delete (optional)
            - boot (optional)
            - device_name (optional)
            - disk_encryption_key (optional, block):
                - kms_key_name (optional)
                - kms_key_service_account (optional)
                - raw_key (optional)
                - rsa_encrypted_key (optional)
            - disk_interface (optional)
            - disk_size_gb (optional)
            - disk_type (optional)
            - guest_os_feature (optional, block):
                - type (optional)
            - index (optional)
            - initialize_params (optional, block):
                - disk_name (optional)
                - replica_zones (optional)
            - kind (optional)
            - license (optional)
            - mode (optional)
            - saved_state (optional)
            - source (optional)
            - type (optional)
        - display_device (optional, block):
            - enable_display (optional)
        - guest_accelerators (optional, block):
            - accelerator_count (optional)
            - accelerator_type (optional)
        - hostname (optional)
        - instance_encryption_key (optional, block):
            - kms_key_name (optional)
            - kms_key_service_account (optional)
            - raw_key (optional)
            - rsa_encrypted_key (optional)
        - key_revocation_action_type (optional)
        - labels (optional, block):
            - key (required)
            - value (optional)
        - machine_type (optional)
        - metadata (optional, block):
            - items (optional, block):
                - key (optional)
                - value (optional)
        - min_cpu_platform (optional)
        - name (required)
        - network_interfaces (optional, block):
            - access_configs (optional, block):
                - external_ip (optional)
                - external_ipv6 (optional)
                - external_ipv6_prefix_length (optional)
                - name (optional)
                - network_tier (optional)
                - public_ptr_domain_name (optional)
                - set_public_ptr (optional)
                - type (optional)
            - alias_ip_ranges (optional, block):
                - ip_cidr_range (optional)
                - subnetwork_range_name (optional)
            - internal_ipv6_prefix_length (optional)
            - ip_address (optional)
            - ipv6_access_configs (optional, block):
                - external_ip (optional)
                - external_ipv6 (optional)
                - external_ipv6_prefix_length (optional)
                - name (optional)
                - network_tier (optional)
                - public_ptr_domain_name (optional)
                - set_public_ptr (optional)
                - type (optional)
            - ipv6_access_type (optional)
            - ipv6_address (optional)
            - network (optional)
            - network_attachment (optional)
            - nic_type (optional)
            - queue_count (optional)
            - stack_type (optional)
            - subnetwork (optional)
        - network_performance_config (optional, block):
            - total_egress_bandwidth_tier (optional)
        - params (optional, block):
            - resource_manager_tags (optional, block):
                - key (required)
                - value (optional)
        - private_ipv6_google_access (optional)
        - resource_policies (optional)
        - scheduling (optional, block):
            - automatic_restart (optional)
            - instance_termination_action (optional)
            - local_ssd_recovery_timeout (optional, block):
                - nanos (optional)
                - seconds (optional)
            - max_run_duration (optional, block):
                - nanos (optional)
                - seconds (optional)
            - min_node_cpus (optional)
            - node_affinities (optional, block):
                - key (optional)
                - operator (optional)
                - values (optional)
            - on_host_maintenance (optional)
            - preemptible (optional)
            - provisioning_model (optional)
            - termination_time (optional)
        - service_accounts (optional, block):
            - email (optional)
            - scopes (optional)
        - shielded_instance_config (optional, block):
            - enable_integrity_monitoring (optional)
            - enable_secure_boot (optional)
            - enable_vtpm (optional)
        - tags (optional, block):
            - items (optional)
    - compute_instance_target_environment (block):
        - project (required)
        - use_project_service_account (optional)
        - zone (required)
    - disk_restore_properties (block):
        - access_mode (optional)
        - architecture (optional)
        - description (optional)
        - disk_encryption_key (optional, block):
            - kms_key_name (optional)
            - kms_key_service_account (optional)
            - raw_key (optional)
            - rsa_encrypted_key (optional)
        - enable_confidential_compute (optional)
        - guest_os_feature (optional, block):
            - type (optional)
        - labels (optional, block):
            - key (required)
            - value (optional)
        - licenses (optional)
        - name (required)
        - physical_block_size_bytes (optional)
        - provisioned_iops (optional)
        - provisioned_throughput (optional)
        - resource_manager_tags (optional, block):
            - key (required)
            - value (optional)
        - resource_policy (optional)
        - size_gb (required)
        - storage_pool (optional)
        - type (required)
    - disk_target_environment (block):
        - project (required)
        - use_project_service_account (optional)
        - zone (required)
    - region_disk_target_environment (block):
        - project (required)
        - region (required)
        - replica_zones (required)
        - use_project_service_account (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
EOT

  type = map(object({
    backup_id                  = string
    backup_vault_id            = string
    data_source_id             = string
    location                   = string
    clear_overrides_field_mask = optional(string)
    delete_restored_instance   = optional(bool)
    deletion_policy            = optional(string)
    name                       = optional(string)
    request_id                 = optional(string)
    compute_instance_restore_properties = optional(object({
      advanced_machine_features = optional(object({
        enable_nested_virtualization = optional(bool)
        enable_uefi_networking       = optional(bool)
        threads_per_core             = optional(number)
        visible_core_count           = optional(number)
      }))
      allocation_affinity = optional(object({
        consume_allocation_type = optional(string)
        key                     = optional(string)
        values                  = optional(list(string))
      }))
      can_ip_forward = optional(bool)
      confidential_instance_config = optional(object({
        enable_confidential_compute = optional(bool)
      }))
      deletion_protection = optional(bool)
      description         = optional(string)
      disks = optional(list(object({
        auto_delete = optional(bool)
        boot        = optional(bool)
        device_name = optional(string)
        disk_encryption_key = optional(object({
          kms_key_name            = optional(string)
          kms_key_service_account = optional(string)
          raw_key                 = optional(string)
          rsa_encrypted_key       = optional(string)
        }))
        disk_interface = optional(string)
        disk_size_gb   = optional(number)
        disk_type      = optional(string)
        guest_os_feature = optional(list(object({
          type = optional(string)
        })))
        index = optional(number)
        initialize_params = optional(object({
          disk_name     = optional(string)
          replica_zones = optional(list(string))
        }))
        kind        = optional(string)
        license     = optional(list(string))
        mode        = optional(string)
        saved_state = optional(string)
        source      = optional(string)
        type        = optional(string)
      })))
      display_device = optional(object({
        enable_display = optional(bool)
      }))
      guest_accelerators = optional(list(object({
        accelerator_count = optional(number)
        accelerator_type  = optional(string)
      })))
      hostname = optional(string)
      instance_encryption_key = optional(object({
        kms_key_name            = optional(string)
        kms_key_service_account = optional(string)
        raw_key                 = optional(string)
        rsa_encrypted_key       = optional(string)
      }))
      key_revocation_action_type = optional(string)
      labels = optional(list(object({
        key   = string
        value = optional(string)
      })))
      machine_type = optional(string)
      metadata = optional(object({
        items = optional(list(object({
          key   = optional(string)
          value = optional(string)
        })))
      }))
      min_cpu_platform = optional(string)
      name             = string
      network_interfaces = optional(list(object({
        access_configs = optional(list(object({
          external_ip                 = optional(string)
          external_ipv6               = optional(string)
          external_ipv6_prefix_length = optional(number)
          name                        = optional(string)
          network_tier                = optional(string)
          public_ptr_domain_name      = optional(string)
          set_public_ptr              = optional(bool)
          type                        = optional(string)
        })))
        alias_ip_ranges = optional(list(object({
          ip_cidr_range         = optional(string)
          subnetwork_range_name = optional(string)
        })))
        internal_ipv6_prefix_length = optional(number)
        ip_address                  = optional(string)
        ipv6_access_configs = optional(list(object({
          external_ip                 = optional(string)
          external_ipv6               = optional(string)
          external_ipv6_prefix_length = optional(number)
          name                        = optional(string)
          network_tier                = optional(string)
          public_ptr_domain_name      = optional(string)
          set_public_ptr              = optional(bool)
          type                        = optional(string)
        })))
        ipv6_access_type   = optional(string)
        ipv6_address       = optional(string)
        network            = optional(string)
        network_attachment = optional(string)
        nic_type           = optional(string)
        queue_count        = optional(number)
        stack_type         = optional(string)
        subnetwork         = optional(string)
      })))
      network_performance_config = optional(object({
        total_egress_bandwidth_tier = optional(string)
      }))
      params = optional(object({
        resource_manager_tags = optional(list(object({
          key   = string
          value = optional(string)
        })))
      }))
      private_ipv6_google_access = optional(string)
      resource_policies          = optional(list(string))
      scheduling = optional(object({
        automatic_restart           = optional(bool)
        instance_termination_action = optional(string)
        local_ssd_recovery_timeout = optional(object({
          nanos   = optional(number)
          seconds = optional(number)
        }))
        max_run_duration = optional(object({
          nanos   = optional(number)
          seconds = optional(number)
        }))
        min_node_cpus = optional(number)
        node_affinities = optional(list(object({
          key      = optional(string)
          operator = optional(string)
          values   = optional(list(string))
        })))
        on_host_maintenance = optional(string)
        preemptible         = optional(bool)
        provisioning_model  = optional(string)
        termination_time    = optional(string)
      }))
      service_accounts = optional(list(object({
        email  = optional(string)
        scopes = optional(list(string))
      })))
      shielded_instance_config = optional(object({
        enable_integrity_monitoring = optional(bool)
        enable_secure_boot          = optional(bool)
        enable_vtpm                 = optional(bool)
      }))
      tags = optional(object({
        items = optional(list(string))
      }))
    }))
    compute_instance_target_environment = optional(object({
      project                     = string
      use_project_service_account = optional(bool)
      zone                        = string
    }))
    disk_restore_properties = optional(object({
      access_mode  = optional(string)
      architecture = optional(string)
      description  = optional(string)
      disk_encryption_key = optional(object({
        kms_key_name            = optional(string)
        kms_key_service_account = optional(string)
        raw_key                 = optional(string)
        rsa_encrypted_key       = optional(string)
      }))
      enable_confidential_compute = optional(bool)
      guest_os_feature = optional(list(object({
        type = optional(string)
      })))
      labels = optional(list(object({
        key   = string
        value = optional(string)
      })))
      licenses                  = optional(list(string))
      name                      = string
      physical_block_size_bytes = optional(number)
      provisioned_iops          = optional(number)
      provisioned_throughput    = optional(number)
      resource_manager_tags = optional(list(object({
        key   = string
        value = optional(string)
      })))
      resource_policy = optional(list(string))
      size_gb         = number
      storage_pool    = optional(string)
      type            = string
    }))
    disk_target_environment = optional(object({
      project                     = string
      use_project_service_account = optional(bool)
      zone                        = string
    }))
    region_disk_target_environment = optional(object({
      project                     = string
      region                      = string
      replica_zones               = list(string)
      use_project_service_account = optional(bool)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
    }))
  }))
  # Note: 23 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

