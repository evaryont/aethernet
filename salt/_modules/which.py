import salt.utils

def find(binary_name):
    '''
    Try to find the specified binary in $PATH

    CLI Example::

        salt '*' which.find dig
    '''
    return salt.utils.which(binary_name)

def missing(binary_name):
   '''
   Try to prove that the specified binary is *not* $PATH

   CLI Example::

       salt '*' which.missing brew
   '''
   return not bool(salt.utils.which(binary_name))
