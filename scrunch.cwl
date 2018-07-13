
#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

label: Scrunch Pulsar data in time and frequency with an updated model of the Ephemeris
doc: Note this workflow uses the singularity image found at https://www.singularity-hub.org/collections/882.

baseCommand: [singularity, exec]

requirements:
  InitialWorkDirRequirement:
    listing:
      - $(inputs.pulsar_fits_file)

inputs:
  singularity_image:
    type: File
    inputBinding:
      position: 1
  pulsar_tool:
    type: string
    inputBinding:
      position: 2
      prefix: pam
  output_file_extension:
    type: string
    inputBinding:
      position: 3
      prefix: -e
  pulsar_ephemeris:
    type: File
    inputBinding:
      position: 5
      prefix: -E
  pulsar_fits_file:
    type: File
    inputBinding:
      position: 6
      valueFrom: $(self.basename)

outputs:
  scrunched_data:
    type: File
    outputBinding:
      glob: '*.FT'
