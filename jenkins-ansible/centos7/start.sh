#!/bin/bash

__create_user() 
{
# Create a user to SSH into as.
useradd remote_user
SSH_USERPASS=1234
echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin remote_user)
echo ssh user password: $SSH_USERPASS
}

# Call all functions
__create_user