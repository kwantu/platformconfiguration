[back](https://github.com/kwantu/platformconfiguration/wiki/EPWP_Setup)

This service finds issues where the system reports a message that the idnumber already exists:

```rest
https://epwprs.dpw.gov.za/exist/rest/db/kwantu-resource/_tools/epwpFixBeneficiaryIDerrors.xql?communityId=<communityId>&idnumber=<idnumber>

where
<idnumber> = idnumber getting the duplicate message
<communityId> = communityId of the public body

-- example
https://epwprs.dpw.gov.za/exist/rest/db/kwantu-resource/_tools/epwpFixBeneficiaryIDerrors.xql?communityId=wc-d-128-eb5ef5bc-f74c-4bfd-935f-f449f60a1c4e&idnumber=9512225748081
``
