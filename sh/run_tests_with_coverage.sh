
export ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export SH_DIR="${ROOT_DIR}/sh"

source "${SH_DIR}/containers_down.sh"
source "${SH_DIR}/containers_up_healthy_and_clean.sh"
source "${SH_DIR}/echo_versioner_env_vars.sh"
source "${SH_DIR}/lib.sh"
source "${SH_DIR}/test_in_containers.sh"
export $(echo_versioner_env_vars)

run_tests_with_coverage()
{
  set +e
  status=0
  server_up_healthy_and_clean
  client_up_healthy_and_clean "$@"
  test_in_containers "$@" || status=$?
  echo "Containers down"
  containers_down
  echo "Writing test evidence json"
  write_test_evidence_json
  echo "Returning status=$status"
  set -e
  return ${status}
}