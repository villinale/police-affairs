export function goToLogin(that) {
    that.$router.push('/login');
}

export function goToReportCase(that) {
    console.log("go to report case");
    that.$router.push('/report');
}

export function goToCaseInfoView(that, caseId) {
    console.log("go to case info view");
    that.$router.push('/caseInfo/' + caseId);
}