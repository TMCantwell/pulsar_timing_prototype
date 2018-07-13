cwlVersion: v1.0
class: Workflow

inputs:
  sing_image: File
  scrunch_tool: string
  scrunch_extension: string
  new_ephemeris: File
  input_fits: File
  toa_tool: string
  input_pulse_profile: File
  toa_file_format: string
  output_toa_file_name: string

outputs:
  toa:
    type: File
    outputSource: calculate_toa/toa
  scrunched_fits_file: 
    type: File
    outputSource: scrunch_data/scrunched_data
steps:
  scrunch_data:
    run: scrunch.cwl
    in:
      singularity_image: sing_image
      pulsar_tool: scrunch_tool
      output_file_extension: scrunch_extension
      pulsar_ephemeris: new_ephemeris
      pulsar_fits_file: input_fits
    out: [scrunched_data]

  calculate_toa:
    run: toa.cwl
    in:
      singularity_image: sing_image
      pulsar_tool: toa_tool
      pulse_profile: input_pulse_profile
      output_format: toa_file_format
      scrunched_pulsar_fits_file: scrunch_data/scrunched_data
      output_filename: output_toa_file_name
    out: [toa]


s:author:
  - class: s:Person
    s:identifier: https://orcid.org/0000-0001-9159-6599
    s:email: therese.cantwell@manchester.ac.uk
    s:name: Therese Cantwell


$namespaces:
  s: https://schema.org/

$schemas:
 - https://schema.org/docs/schema_org_rdfa.html
