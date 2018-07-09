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
  classout:
    type: File
    outputSource: calculate_toa/toa

steps:
  scrunch_data:
    run: scrunch.cwl
    in:
      singularity_image: sing_image
      pulsar_tool: scrunch_tool
      output_file_extension: scrunch_extension
      pulsar_ephemeris: new_ephemeris
      pulsar_fits_file: input_fits
    out: [step_1_out]

  calculate_toa:
    run: toa.cwl
    in:
      singularity_image: sing_image
      pulsar_tool: toa_tool
      pulse_profile: input_pulse_profile
      output_format: toa_file_format
      scrunched_pulsar_fits_file: scrunch_data/step_1_out
      output_file_name: output_toa_file_name
