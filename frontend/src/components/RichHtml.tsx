import type { ElementType } from 'react';

interface Props {
  html: string;
  className?: string;
  tag?: ElementType;
}

export default function RichHtml({ html, className, tag: Tag = 'span' }: Props) {
  if (!html) return null;
  return (
    <Tag
      className={className}
      dangerouslySetInnerHTML={{ __html: html }}
    />
  );
}
