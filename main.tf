# 1. Definiera vilken molnleverantör som används
provider "google" {
  project = "green-chalice-491020-a5" # 
  region  = "europe-north1"       # Stockholm
  zone    = "europe-north1-a"
}

# 2. Skapa en Google Cloud VM (Compute Engine)
resource "google_compute_instance" "vm_instance" {
  name         = "lab1-terraform-vm"
  machine_type = "e2-micro" # Billigaste alternativet, bra för labb
  zone         = "europe-north1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11" # Operativsystem
    }
  }

  network_interface {
    network = "default"
    access_config {
      # Detta ger VM:en en publik IP-adress
    }
  }
}

# 3. Skapa en Snapshot-policy (för backup-kravet i labben)
resource "google_compute_resource_policy" "daily_backup" {
  name   = "daily-backup-policy"
  region = "europe-north1"
  snapshot_schedule_policy {
    schedule {
      daily_schedule {
        days_in_cycle = 1
        start_time    = "04:00"
      }
    }
  }
}

# 4. Koppla policyn till VM-disken
resource "google_compute_disk_resource_policy_attachment" "attachment" {
  name = google_compute_resource_policy.daily_backup.name
  disk = google_compute_instance.vm_instance.name
  zone = "europe-north1-a"
}
