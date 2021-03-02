import * as gitlab from '@pulumi/gitlab';

const project = new gitlab.Project('project', {
  name: 'test',
  path: 'test-proj',
});

export const url = project.webUrl;
