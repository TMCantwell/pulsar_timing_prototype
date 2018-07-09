
#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

label: Scrunch Pulsar data in time and frequency with an updated model of the Ephemeris
doc: Note this workflow uses the singularity image found at https://www.singularity-hub.org/collections/882.

baseCommand: [singularity, exec]
inputs:
  singularity_image:
    type: File
    format: simg
    inputBinding:
      position: 1
  pulsar_tool:
    type: string
    inputBinding:
      position: 2
  output_file_extension:
    type: string
    inputBinding:
      position: 3
      prefix: -e
  pulsar_ephemeris:
    type: File
    format: tempo2
    inputBinding:
      position: 4
      prefix: -E
  pulsar_fits_file:
    type: File
    format: PSRFITS
    inputBinding:
      position: 5


outputs:
  scrunched_data:
    type: File
    format: PSRFITS
    outputBinding:
      glob: *$(inputs.output_file_extension)

s:author:
  - class: s:Person
    s:identifier: https://orcid.org/0000-0001-9159-6599
    s:email: therese.cantwell@manchester.ac.uk
    s:name: Therese Cantwell

