
#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

label: Calculate time of arrival
doc: Note this workflow uses the singularity image found at https://www.singularity-hub.org/collections/882.

baseCommand: [singularity, exec]
stdout: toa_test.txt

requirements:
  InitialWorkDirRequirement:
    listing:
      - $(inputs.scrunched_pulsar_fits_file)

inputs:
  singularity_image:
    type: File
    inputBinding:
      position: 1
  pulsar_tool:
    type: string
    inputBinding:
      position: 2
  pulse_profile:
    type: File
    inputBinding:
      position: 3
      prefix: -s
  output_format:
    type: string
    inputBinding:
      position: 4
      prefix: -f
  scrunched_pulsar_fits_file:
    type: File
    inputBinding:
      position: 5
      valueFrom: $(self.basename)


outputs:
  toa:
    type: stdout

s:author:
  - class: s:Person
    s:identifier: https://orcid.org/0000-0001-9159-6599
    s:email: therese.cantwell@manchester.ac.uk
    s:name: Therese Cantwell


$namespaces:
  s: https://schema.org/

$schemas:
 - https://schema.org/docs/schema_org_rdfa.html


