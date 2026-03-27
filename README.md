# Lab 1: Terraform GCP VM Setup

Det här projektet använder Terraform för att skapa en Google Cloud VM med en daglig snapshot-backuppolicy på disken. Projektet inkluderar även en GitHub Actions-pipeline som automatiskt kör Terraform-plan och apply när kod pushas till main, vilket gör infrastrukturen både reproducerbar och automatiserad.

För att köra projektet startar man med `terraform init` för att initiera Terraform, sedan `terraform plan` för att se vilka förändringar som kommer göras, och slutligen `terraform apply` för att faktiskt skapa VM:n och backup-policyn i GCP.

Pipelinekörningen visas i GitHub Actions, där alla steg klaras utan fel, och själva VM:n kan ses i GCP Console med korrekt konfigurerad disk och nätverk.  

Projektet inkluderar säkerhetsåtgärder som UFW för att enkelt hantera brandväggsregler och stänga oanvända portar, samt Fail2Ban för att skydda mot brute-force attacker på SSH. Dessutom används minimalt antal öppna portar och dagliga snapshots för att snabbt kunna återställa systemet vid eventuella problem.
<img width="1077" height="722" alt="backup" src="https://github.com/user-attachments/assets/a17c92ea-b8ab-449b-9d52-69f1a25e1623" />
<img width="1343" height="809" alt="terraform" src="https://github.com/user-attachments/assets/1788241f-ca58-4780-a258-dea9f44a79e3" />
<img width="1343" height="224" alt="vm" src="https://github.com/user-attachments/assets/2bf70ecb-511e-4de0-805b-7067330b362d" />
<img width="1343" height="352" alt="Skärmavbild 2026-03-23 kl  12 25 21" src="https://github.com/user-attachments/assets/97f59d1a-ebbb-4dff-b348-6d9124f1e5bb" />

Här har du bild när jag kör terraform init = <img width="574" height="256" alt="Skärmavbild 2026-03-27 kl  12 46 44" src="https://github.com/user-attachments/assets/ef2fcafe-bc6b-4c7f-9a15-0b71b4b33f32" />

Initialisering (terraform init): Verifierar att providers (Google v7.24.0) och backend har laddats ner korrekt.

Autentisering (gcloud auth list): Bekräftar att sessionen är aktiv för johnnasviktor@gmail.com.

Planering (terraform plan): Visar att Terraform identifierat nödvändiga ändringar (ersättning av VM på grund av ändrat startup-script).

Exekvering (terraform apply): Slutgiltigt bevis på lyckad körning:

Destroy: Den gamla resursen togs bort på 31s.

Create: Den nya resursen skapades på 17s.

Status: Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
Här har du bild när jag kör  terraform plan = <img width="1354" height="900" alt="Skärmavbild 2026-03-27 kl  12 58 56" src="https://github.com/user-attachments/assets/9bc2a36c-0c06-4772-8593-a6a6e63df697" />

här får du bilder när jag kör terraform Apply

<img width="581" height="325" alt="Skärmavbild 2026-03-27 kl  13 16 11" src="https://github.com/user-attachments/assets/95d7f687-ee3c-4c6e-a88f-2287cde13a23" />

<img width="581" height="325" alt="Skärmavbild 2026-03-27 kl  13 27 20" src="https://github.com/user-attachments/assets/0e1963ce-b14a-4193-991a-e7742274afdc" />

