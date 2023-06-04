export function isClose(status) {
    if (status == '已结束') return true
    else return false
}

export function isAssigned(status) {
    if (status == '待分配') return false
    else return true
}

export function getLocString(info) {
    return info.c_province + '-' + info.c_area + '-' + info.c_address;
}

export function getStatusColor(status) {
    if (status == '待分配') return 'red'
    else if (status == '调查中') return 'primary'
    else return 'grey-lighten-1'
}

export function getLevelColor(level) {
    if (level == '严重') return 'red'
    else if (level == '较大') return 'amber-accent-2'
    else if (level == '一般') return 'green-lighten-3'
    else if (level == '轻微') return 'grey-darken-1'
}