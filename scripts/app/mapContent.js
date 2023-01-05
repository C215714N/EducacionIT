function mapContent(data, tag, callback){
    let content = '';
    data.map(d => content += callback(d))
    tag.innerHTML = content;
}

export default mapContent;
