package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	test_structure "github.com/gruntwork-io/terratest/modules/test-structure"
	"github.com/stretchr/testify/assert"
)

func TestTerraformListenerRule(t *testing.T) {
	t.Parallel()

	exampleFolder := test_structure.CopyTerraformFolderToTemp(t, "../..", "test")

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: exampleFolder,
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	targetGroupARN := terraform.Output(t, terraformOptions, "target_group_arn")
	listenerRuleARN := terraform.Output(t, terraformOptions, "listener_rule_arn")

	assert.NotEmpty(t, targetGroupARN)
	assert.NotEmpty(t, listenerRuleARN)
}
