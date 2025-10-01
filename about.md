# How to use the Technology Radar

To support the technical decision-making process, the software industry typically leverages technology maps that provide a snapshot of the underlying technologies we build our stack upon while capturing contextual and compelling historical tracking.

This knowledge-sharing tool acts as both a breeding ground to feed architecture decision context upstream and as a resulting artifact to make ADR outcomes explicit downstream. Combining ADRs and the technology radar supports teams in both internal and external communication.

## How it is created

The Technology Radar is a collaborative effort. Items come from all team members, including developers, architects, and other stakeholders. We leverage the Pull Request workflow to propose, discuss, and merge changes to the radar. Each item is a self-contained markdown file, with front-matter gathering metadata while the body documents meaningful lifecycle milestones, especially to support the decision-making process when moving from one ring to another, as well as evolution within the same ring. History tracking is automatically performed using a timestamped directory structure. Versioning is computed based on the number of timestamped directories.

## How should it be used

The radar serves as an overview of technologies that we believe everyone on the teams should be aware of currently.

Its goal is to guide and inspire daily work within the teams. Additionally, it aims to provide valuable information and a high-level perspective to enable decisions to be made with a deeper understanding of the subject matter, resulting in more informed and coordinated choices.

We also hope that developers outside of a given team will find the information in our technology overview inspiring.

We categorize the items into four quadrants. When it's not entirely clear where an item belongs, we choose the best fit.

The quadrants are:

- **Staples**: In this category, we include building blocks we leverage to craft software. Depending on the context, the granularity of these blocks can vary from languages to frameworks, from bare metal STCs to off-the-shelf services.
- **Security & Compliance**: This quadrant is dedicated to technologies and tools that help streamline and enforce security and compliance rules.
- **Platforms & Operations**: In this quadrant, we group technologies related to the operation of software, infrastructure, and platform-related tools and services.
- **Tools & Patterns**: A range of software tools and patterns, from simple productivity enhancers to comprehensive project solutions, catering to various project needs.

Each of the items is classified in one of these rings:

- **Adopt**: We wholeheartedly recommend this technology. It has been extensively used in many teams for an extended period, proving its stability and utility. Items in this ring represent mature, stable technologies that form the foundation of our technology stack. The absence of recent changes to items in this ring does not indicate deprecation or obsolescence; rather, it often reflects the technology's maturity and proven reliability.
- **Trial**: We have successfully implemented this technology and suggest taking a closer look at it. The aim here is to scrutinize these items more closely with the intention of potentially elevating them to the 'Adopt' level.
- **Assess**: We have experimented with this technology and find it promising. We recommend exploring these items when you encounter a specific need for the technology in your project.
- **Hold**: This category is somewhat unique. Unlike the others, it advises discontinuing or refraining from using certain technologies. This does not necessarily imply that they are inherently bad; it often may be acceptable to use them in existing projects. However, we move items here when we believe they should no longer be employed, as we have identified better options or alternatives.

Items can also be tagged to provide filtered radar view.