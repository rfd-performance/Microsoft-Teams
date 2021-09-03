#!/bin/bash

# This script will post a message to a MS Teams channel via web hook
#     Coming soon... sanitizing/formatting incoming messages ofr reserved characters etc. For now you must keep it simple.
#
#   Argument 1: friendlier name for which teams channel to post. This friendly name ONLY exists here, as a mapping to webhooks.
#   Argument 2: The message to post. Supports HTML but be careful until formatter is in place.

case $1 in
	'channel1')
		webhookURI="https://<your_id>.webhook.office.com/webhookb2/20addcf6-0bbe-4851-b17f-7e503e680833@05952ac1-71f2-4808-b23f-2ee2f32e1f52/IncomingWebhook/7d907a1d43d44d7eb5ce4b7b445baaa0/c28c0b6e-4af4-479d-a1e1-b0e8cde2545e"
		;;
	'channel2')
		webhookURI="https://<your_id>.webhook.office.com/webhookb2/e3a7a25b-3cc7-43c8-8ce1-714546a526a0@05952ac1-71f2-4808-b23f-2ee2f32e1f52/IncomingWebhook/1d1fd63989a84aa2a6651dbffe52b14f/733d835a-c4a1-4b78-82d0-7dc84b41e14a"
		;;
	'channel3')
		webhookURI="https://<your_id>.webhook.office.com/webhookb2/e3a7a25b-3cc7-43c8-8ce1-714546a526a0@05952ac1-71f2-4808-b23f-2ee2f32e1f52/IncomingWebhook/bf43eb583b9d4d6da7fa0fe5f75094b2/c28c0b6e-4af4-479d-a1e1-b0e8cde2545e"
    ;;
esac

escaped_body=$(python3 ./escapeHtml.py "$2")
echo ${escaped_body}
curl -H 'Content-Type: application/json' -X POST -d "{\"text\": \"${escaped_body}\"}" "$webhookURI"
