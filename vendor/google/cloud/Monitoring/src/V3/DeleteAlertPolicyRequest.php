<?php
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/monitoring/v3/alert_service.proto

namespace Google\Cloud\Monitoring\V3;

use Google\Protobuf\Internal\GPBType;
use Google\Protobuf\Internal\RepeatedField;
use Google\Protobuf\Internal\GPBUtil;

/**
 * The protocol for the `DeleteAlertPolicy` request.
 *
 * Generated from protobuf message <code>google.monitoring.v3.DeleteAlertPolicyRequest</code>
 */
class DeleteAlertPolicyRequest extends \Google\Protobuf\Internal\Message
{
    /**
     * Required. The alerting policy to delete. The format is:
     *     projects/[PROJECT_ID_OR_NUMBER]/alertPolicies/[ALERT_POLICY_ID]
     * For more information, see [AlertPolicy][google.monitoring.v3.AlertPolicy].
     *
     * Generated from protobuf field <code>string name = 3 [(.google.api.field_behavior) = REQUIRED, (.google.api.resource_reference) = {</code>
     */
    private $name = '';

    /**
     * Constructor.
     *
     * @param array $data {
     *     Optional. Data for populating the Message object.
     *
     *     @type string $name
     *           Required. The alerting policy to delete. The format is:
     *               projects/[PROJECT_ID_OR_NUMBER]/alertPolicies/[ALERT_POLICY_ID]
     *           For more information, see [AlertPolicy][google.monitoring.v3.AlertPolicy].
     * }
     */
    public function __construct($data = NULL) {
        \GPBMetadata\Google\Monitoring\V3\AlertService::initOnce();
        parent::__construct($data);
    }

    /**
     * Required. The alerting policy to delete. The format is:
     *     projects/[PROJECT_ID_OR_NUMBER]/alertPolicies/[ALERT_POLICY_ID]
     * For more information, see [AlertPolicy][google.monitoring.v3.AlertPolicy].
     *
     * Generated from protobuf field <code>string name = 3 [(.google.api.field_behavior) = REQUIRED, (.google.api.resource_reference) = {</code>
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Required. The alerting policy to delete. The format is:
     *     projects/[PROJECT_ID_OR_NUMBER]/alertPolicies/[ALERT_POLICY_ID]
     * For more information, see [AlertPolicy][google.monitoring.v3.AlertPolicy].
     *
     * Generated from protobuf field <code>string name = 3 [(.google.api.field_behavior) = REQUIRED, (.google.api.resource_reference) = {</code>
     * @param string $var
     * @return $this
     */
    public function setName($var)
    {
        GPBUtil::checkString($var, True);
        $this->name = $var;

        return $this;
    }

}
