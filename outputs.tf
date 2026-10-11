output "backup_dr_restore_workloads_id" {
  description = "Map of id values across all backup_dr_restore_workloads, keyed the same as var.backup_dr_restore_workloads except keys with no id are omitted"
  value       = { for k, v in google_backup_dr_restore_workload.backup_dr_restore_workloads : k => v.id if v.id != null && length(v.id) > 0 }
}
output "backup_dr_restore_workloads_backup_id" {
  description = "Map of backup_id values across all backup_dr_restore_workloads, keyed the same as var.backup_dr_restore_workloads except keys with no backup_id are omitted"
  value       = { for k, v in google_backup_dr_restore_workload.backup_dr_restore_workloads : k => v.backup_id if v.backup_id != null && length(v.backup_id) > 0 }
}
output "backup_dr_restore_workloads_backup_vault_id" {
  description = "Map of backup_vault_id values across all backup_dr_restore_workloads, keyed the same as var.backup_dr_restore_workloads except keys with no backup_vault_id are omitted"
  value       = { for k, v in google_backup_dr_restore_workload.backup_dr_restore_workloads : k => v.backup_vault_id if v.backup_vault_id != null && length(v.backup_vault_id) > 0 }
}
output "backup_dr_restore_workloads_clear_overrides_field_mask" {
  description = "Map of clear_overrides_field_mask values across all backup_dr_restore_workloads, keyed the same as var.backup_dr_restore_workloads except keys with no clear_overrides_field_mask are omitted"
  value       = { for k, v in google_backup_dr_restore_workload.backup_dr_restore_workloads : k => v.clear_overrides_field_mask if v.clear_overrides_field_mask != null && length(v.clear_overrides_field_mask) > 0 }
}
output "backup_dr_restore_workloads_compute_instance_restore_properties" {
  description = "Map of compute_instance_restore_properties values across all backup_dr_restore_workloads, keyed the same as var.backup_dr_restore_workloads except keys with no compute_instance_restore_properties are omitted"
  value       = { for k, v in google_backup_dr_restore_workload.backup_dr_restore_workloads : k => one(v.compute_instance_restore_properties) if v.compute_instance_restore_properties != null && length(v.compute_instance_restore_properties) > 0 }
  sensitive   = true
}
output "backup_dr_restore_workloads_compute_instance_target_environment" {
  description = "Map of compute_instance_target_environment values across all backup_dr_restore_workloads, keyed the same as var.backup_dr_restore_workloads except keys with no compute_instance_target_environment are omitted"
  value       = { for k, v in google_backup_dr_restore_workload.backup_dr_restore_workloads : k => one(v.compute_instance_target_environment) if v.compute_instance_target_environment != null && length(v.compute_instance_target_environment) > 0 }
}
output "backup_dr_restore_workloads_data_source_id" {
  description = "Map of data_source_id values across all backup_dr_restore_workloads, keyed the same as var.backup_dr_restore_workloads except keys with no data_source_id are omitted"
  value       = { for k, v in google_backup_dr_restore_workload.backup_dr_restore_workloads : k => v.data_source_id if v.data_source_id != null && length(v.data_source_id) > 0 }
}
output "backup_dr_restore_workloads_delete_restored_instance" {
  description = "Map of delete_restored_instance values across all backup_dr_restore_workloads, keyed the same as var.backup_dr_restore_workloads except keys with no delete_restored_instance are omitted"
  value       = { for k, v in google_backup_dr_restore_workload.backup_dr_restore_workloads : k => v.delete_restored_instance if v.delete_restored_instance != null }
}
output "backup_dr_restore_workloads_deletion_policy" {
  description = "Map of deletion_policy values across all backup_dr_restore_workloads, keyed the same as var.backup_dr_restore_workloads except keys with no deletion_policy are omitted"
  value       = { for k, v in google_backup_dr_restore_workload.backup_dr_restore_workloads : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "backup_dr_restore_workloads_disk_restore_properties" {
  description = "Map of disk_restore_properties values across all backup_dr_restore_workloads, keyed the same as var.backup_dr_restore_workloads except keys with no disk_restore_properties are omitted"
  value       = { for k, v in google_backup_dr_restore_workload.backup_dr_restore_workloads : k => one(v.disk_restore_properties) if v.disk_restore_properties != null && length(v.disk_restore_properties) > 0 }
  sensitive   = true
}
output "backup_dr_restore_workloads_disk_target_environment" {
  description = "Map of disk_target_environment values across all backup_dr_restore_workloads, keyed the same as var.backup_dr_restore_workloads except keys with no disk_target_environment are omitted"
  value       = { for k, v in google_backup_dr_restore_workload.backup_dr_restore_workloads : k => one(v.disk_target_environment) if v.disk_target_environment != null && length(v.disk_target_environment) > 0 }
}
output "backup_dr_restore_workloads_location" {
  description = "Map of location values across all backup_dr_restore_workloads, keyed the same as var.backup_dr_restore_workloads except keys with no location are omitted"
  value       = { for k, v in google_backup_dr_restore_workload.backup_dr_restore_workloads : k => v.location if v.location != null && length(v.location) > 0 }
}
output "backup_dr_restore_workloads_name" {
  description = "Map of name values across all backup_dr_restore_workloads, keyed the same as var.backup_dr_restore_workloads except keys with no name are omitted"
  value       = { for k, v in google_backup_dr_restore_workload.backup_dr_restore_workloads : k => v.name if v.name != null && length(v.name) > 0 }
}
output "backup_dr_restore_workloads_region_disk_target_environment" {
  description = "Map of region_disk_target_environment values across all backup_dr_restore_workloads, keyed the same as var.backup_dr_restore_workloads except keys with no region_disk_target_environment are omitted"
  value       = { for k, v in google_backup_dr_restore_workload.backup_dr_restore_workloads : k => one(v.region_disk_target_environment) if v.region_disk_target_environment != null && length(v.region_disk_target_environment) > 0 }
}
output "backup_dr_restore_workloads_request_id" {
  description = "Map of request_id values across all backup_dr_restore_workloads, keyed the same as var.backup_dr_restore_workloads except keys with no request_id are omitted"
  value       = { for k, v in google_backup_dr_restore_workload.backup_dr_restore_workloads : k => v.request_id if v.request_id != null && length(v.request_id) > 0 }
}
output "backup_dr_restore_workloads_target_resource" {
  description = "Map of target_resource values across all backup_dr_restore_workloads, keyed the same as var.backup_dr_restore_workloads except keys with no target_resource are omitted"
  value       = { for k, v in google_backup_dr_restore_workload.backup_dr_restore_workloads : k => v.target_resource if v.target_resource != null && length(v.target_resource) > 0 }
}

