def clean_operation(x):
    if 'VYBER' in x:
        return 'VYBER'
    elif 'PREVOD' in x:
        return 'PREVOD'
    elif 'VKLAD' in x:
        return 'VKLAD'
    else: return 'UNKNOW'
    
def clean_ksymbol(x):
    if x in ['',' ']:
        return 'UNKNOW'
    else: return x
    
def clean_duration(x):
    if x >= 60:
        return '48'
    else: return x
    
def clean_steps(data):
    data['operation']=data['operation'].apply(clean_operation)
    data['k_symbol']=data['k_symbol'].apply(clean_ksymbol)
    data['duration']=data['duration'].apply(clean_duration)
