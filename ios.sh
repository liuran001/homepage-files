TEMPFILE=$(mktemp)
DESTFILE=/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles/Library/ConfigurationProfiles/CloudConfigurationDetails.plist

cat > ${TEMPFILE} << _EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>ConfigurationWasApplied</key>
    <true/>
    <key>CloudConfigurationUIComplete</key>
    <true/>
    <key>PostSetupProfileWasInstalled</key>
    <true/>
    <key>AllowPairing</key>
    <true/>
    <key>AutoAdvanceSetup</key>
    <false/>
    <key>AwaitDeviceConfigured</key>
    <false/>
    <key>ConfigurationSource</key>
    <integer>0</integer>
    <key>ConfigurationURL</key>
    <string></string>
    <key>IsMDMUnremovable</key>
    <integer>0</integer>
    <key>IsMandatory</key>
    <false/>
    <key>IsMultiUser</key>
    <false/>
    <key>IsSupervised</key>
    <false/>
    <key>OrganizationAddress</key>
    <string>N/A</string>
    <key>OrganizationAddressLine1</key>
    <string>N/A</string>
    <key>OrganizationAddressLine2</key>
    <string>N/A</string>
    <key>OrganizationCity</key>
    <string>N/A</string>
    <key>OrganizationCountry</key>
    <string>N/A</string>
    <key>OrganizationDepartment</key>
    <string>N/A</string>
    <key>OrganizationEmail</key>
    <string>noreply@localhost.localdomain</string>
    <key>OrganizationMagic</key>
    <string></string>
    <key>OrganizationName</key>
    <string>Skip this step</string>
    <key>OrganizationPhone</key>
    <string>N/A</string>
    <key>OrganizationSupportPhone</key>
    <string>N/A</string>
    <key>OrganizationZipCode</key>
    <string>N/A</string>
    <key>SkipSetup</key>
    <array/>
    <key>SupervisorHostCertificates</key>
    <array/>
</dict>
</plist>
_EOF

scp -P 2222 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ${TEMPFILE} root@localhost:${DESTFILE} && rm ${TEMPFILE}
